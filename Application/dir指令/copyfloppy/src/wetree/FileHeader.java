package wetree;

import java.nio.ByteBuffer;

public class FileHeader {

    private byte[] header = new byte[32];

    public void setFileName(String fileName) {   //文件名
        int length = fileName.length() > 8 ? 8 : fileName.length();
        for (int i = 0; i < length; i++) {
            header[i] = (byte)fileName.charAt(i);
        }
    }

    public void setFileExt(String s) {  //文件拓展名
        int len = s.length() > 3 ? 3 : s.length();
        for (int i = 0; i < len; i++) {
            header[8+i] = (byte)s.charAt(i);
        }
    }

    public void setFileType(Byte t) {   //文件类型，FAT12的格式
        header[11] = t;
    }

    //中间少了10个字节，是微软规定的保留字节

    public void setFileTime(byte[] time) {  //文件生成时间
        header[22] = time[0];
        header[23] = time[1];
    }

    public void setFileDate(byte[] date) {  //文件生成日期
        header[24] = date[0];
        header[25] = date[1];
    }

    public void setFileClusterNo(byte[] no) {   //文件簇编号
        header[26] = no[0];
        header[27] = no[1];
    }

    public void setFileSize(int size) {     //文件的大小
        byte[] buf = ByteBuffer.allocate(4).putInt(size).array();
        for (int i = 0; i < 4; i++) {   //!注意地址的变化
            header[28+i] = buf[3 - i];
        }
    }

    public byte[] getHeaderBuffer() {
        return header; 
    }
    
}