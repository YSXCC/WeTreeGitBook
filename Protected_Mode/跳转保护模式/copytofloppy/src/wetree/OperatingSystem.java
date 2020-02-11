package wetree;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class OperatingSystem {

    private Floppy floppyDisk = new Floppy();
    private int MAX_SECTOR_NUM = 18;

    public static void main(String[] args) {
        OperatingSystem operatingSystem = new OperatingSystem("boot.bat");
        operatingSystem.floppyDisk.makeFloppy("system.img");
    }

    /**
     * 初始化磁盘0面，0号柱面，1号扇区为引导扇区
     * 
     * @param fileName 文件名
     */
    public OperatingSystem(String fileName) {
        writeFileToFloppy(fileName, true, 0, 1);
    }

    /**
     * 把文件内容写入磁盘
     * 
     * @param fileName    文件名
     * @param bootLoader  是否是引导扇区
     * @param cylinder    柱面号
     * @param beginSector 开始的磁道号
     */
    private void writeFileToFloppy(String fileName, boolean bootLoader, int cylinder, int beginSector) {
        File file = new File(fileName);
        InputStream in = null;

        try {
            in = new FileInputStream(file);
            byte[] buf = new byte[512];
            // 是否引导扇区
            if (bootLoader) {
                buf[510] = (byte) 0x55;
                buf[511] = (byte) 0xaa;
            }
            long start = System.currentTimeMillis();
            while(true){
                long lenth = file.length();
                if(lenth > 0){
                    break;
                }
                long current = System.currentTimeMillis();
                if(current - start > 1000){
                    break;
                }
            }
            while (in.read(buf) > 0) {
                floppyDisk.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0, cylinder, beginSector, buf);
                System.out.println("Load file " + fileName + " to floppy with cylinder: " + cylinder + " and sector:"+ beginSector);
                
    			if (beginSector >= MAX_SECTOR_NUM) {
    				beginSector = 0;
    				cylinder++;
                }
                beginSector++;
    		}
    	} catch(IOException e) {
    		e.printStackTrace();
    	}
    }

}
