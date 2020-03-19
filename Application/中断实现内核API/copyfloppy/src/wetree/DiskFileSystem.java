package wetree;

public class DiskFileSystem {

    private Floppy floppyWriter;
    private int beginSection;   //开始扇区
    private int fileHeaderCount = 0;    //文件头的数
    private byte[] buffer = new byte[512];
    private int cylinder = 0;   //柱面号

    private short  fileClusterNo = 0;       //文件偏移扇区
    private int  fileContentCylinder = 7;   //文件内容柱面号
    private int  fileContentSector = 1;     //文件内容扇区号

    private static int SECTOR_SIZE = 512;   //扇区大小

    public DiskFileSystem(Floppy floppyWriter,int cylinder,int beginSection){
        this.floppyWriter = floppyWriter;
        this.cylinder = cylinder;
        this.beginSection = beginSection;
    }

    public void flashFileHeaders() {
        floppyWriter.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0 , cylinder, beginSection, buffer);
    }

    public void flashFileContent(FileHeader fileHeader){
        short sectors = (short)(fileHeader.getFileSize() / SECTOR_SIZE + 1);    //确定扇区号
        
        byte[] s = new byte[2];
        s[1] = (byte)(fileClusterNo >> 8);  //取高8位
        s[0] = (byte)(fileClusterNo >> 0);  //取低8位

        fileHeader.setFileClusterNo(s);

        fileClusterNo += sectors;
        while(sectors > 0){
            if(fileContentSector >= 19){   //扇区数超过18
                fileContentSector = 1;
                fileContentCylinder++;
            }

            if(fileHeader.getFileBuffer() != null){
                floppyWriter.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0, fileContentCylinder, fileContentSector, 
                                        fileHeader.getFileBuffer());
            }

            fileContentSector++;
            sectors--;
        }
    }

    public void addHeader(FileHeader header){
        if (fileHeaderCount >= 16){ //文件头装满了一个扇区
            flashFileHeaders();
            fileHeaderCount = 0;
            buffer = new byte[512];
            beginSection++;
        }

        flashFileContent(header);
        
        byte[] headerBuf = header.getHeaderBuffer();

        for (int i = 0; i < 32; i++){
            buffer[fileHeaderCount * 32 + i] = headerBuf[i]; 
        }

        fileHeaderCount++;
    }

}