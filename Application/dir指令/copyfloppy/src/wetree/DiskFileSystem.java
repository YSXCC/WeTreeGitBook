package wetree;

public class DiskFileSystem {

    private Floppy floppyWriter;
    private int beginSection;   //开始扇区
    private int fileHeaderCount = 0;    //文件头的数
    private byte[] buffer = new byte[512];
    private int cylinder = 0;   //柱面号

    public DiskFileSystem(Floppy floppyWriter,int cylinder,int beginSection){
        this.floppyWriter = floppyWriter;
        this.cylinder = cylinder;
        this.beginSection = beginSection;
    }

    public void flashFileHeaders() {
        floppyWriter.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0 , cylinder, beginSection, buffer);
    }

    public void addHeader(FileHeader header){
        if (fileHeaderCount >= 16){ //装满了一个扇区
            flashFileHeaders();
            fileHeaderCount = 0;
            buffer = new byte[512];
            beginSection++;
        }

        byte[] headerBuf = header.getHeaderBuffer();

        for (int i = 0; i < 32; i++){
            buffer[fileHeaderCount * 32 + i] = headerBuf[i]; 
        }

        fileHeaderCount++;
    }

}