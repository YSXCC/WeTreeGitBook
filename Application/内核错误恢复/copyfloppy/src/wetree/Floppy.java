package wetree;

import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;

public class Floppy {

    /**
     * 磁头0，1
     */
    enum MAGNETIC_HEAD{
        MAGNETIC_HEAD_0,
        MAGNETIC_HEAD_1
    }

    public  int SECTOR_SIZE     = 512;           //扇区大小
    private int CYLINDER_COUNT  = 80;            //柱面总数量
    private int SECTORS_COUNT   = 18;            //一个柱面的扇区总数量
    private MAGNETIC_HEAD magneticHead = MAGNETIC_HEAD.MAGNETIC_HEAD_0;
    private int currentCylinder = 0;             //当前柱面
    private int currentSECTOR   = 0;             //当前扇区

    public void setMagneticHead(MAGNETIC_HEAD head) {
    	magneticHead = head;
    }
    
    public void setCylinder(int cylinder) {
    	if (cylinder < 0) {
    		this.currentCylinder = 0;
    	}
    	else if (cylinder >= 80) {
    		this.currentCylinder = 79;
    	}
    	else {
    		this.currentCylinder = cylinder;
    	}
    }
    
    public void setSector(int sector) {
    	//sector 编号从1到18，因为只能从0开始初始化，就只能这么处理
    	if (sector < 0) {
    		this.currentSECTOR = 0;
    	}
    	else if (sector > 18) {
    		this.currentSECTOR = 18 - 1;
    	}
    	else {
    		this.currentSECTOR = sector - 1;
    	}
    }

    /**
     * 一个磁盘两个面
     */
    private HashMap<Integer,ArrayList<ArrayList<byte[]>> > floppy = new HashMap<>(); 

    public Floppy(){
        initFloppy();
    }

    /**
     * 读磁盘内容
     * @param head  磁头号
     * @param cylinderNum   柱面号
     * @param sectorNum     扇区号
     * @return  二进制数据
     */
    public byte[] readFloppy(MAGNETIC_HEAD head, int cylinderNum, int sectorNum) {
    	setMagneticHead(head);
    	setCylinder(cylinderNum);
    	setSector(sectorNum);
    	
    	ArrayList<ArrayList<byte[]>> disk = floppy.get(this.magneticHead.ordinal());
    	ArrayList<byte[]> cylinder = disk.get(this.currentCylinder);
 
    	byte[] sector = cylinder.get(this.currentSECTOR);
    	
    	return sector;
    }

    /**
     * 写磁盘
     * @param head 磁头号
     * @param cylinderNum 柱面号
     * @param sectorNum   扇区号
     * @param content 写入内容
     */
    public void writeFloppy(MAGNETIC_HEAD head, int cylinderNum, int sectorNum, byte[] content){
        setMagneticHead(head);
        setCylinder(cylinderNum);
        setSector(sectorNum);

        ArrayList<ArrayList<byte[]>> disk = floppy.get(this.magneticHead.ordinal());
        ArrayList<byte[]> cylinder = disk.get(this.currentCylinder);
        
        byte[] buffer = cylinder.get(currentSECTOR);
        System.arraycopy(content, 0, buffer, 0, content.length);

    }
    
    /**
     * 制作磁盘
     * @param fileName 文件名
     */
    public void makeFloppy(String fileName){
        try {
            DataOutputStream outputStream = new DataOutputStream(new FileOutputStream(fileName));
            for (int cylinder = 0; cylinder < CYLINDER_COUNT; cylinder++) {
                for (int head = 0; head <= MAGNETIC_HEAD.MAGNETIC_HEAD_1.ordinal(); head++) {
                    for (int sector = 1; sector <= SECTORS_COUNT; sector++) {
                          byte[] buf = readFloppy(MAGNETIC_HEAD.values()[head], cylinder, sector);
                          outputStream.write(buf);
                    }
                }
            }
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 初始化磁盘
     */
    private void initFloppy(){
        floppy.put(MAGNETIC_HEAD.MAGNETIC_HEAD_0.ordinal(), initFloppyDisk());  //初始化0号磁头对应的磁盘面
        floppy.put(MAGNETIC_HEAD.MAGNETIC_HEAD_1.ordinal(), initFloppyDisk());  //初始化1号磁头对应的磁盘面
    }

    /**
     * 初始化所有柱面
     * @return 一个磁盘面
     */
    private ArrayList<ArrayList<byte[]>> initFloppyDisk(){
        ArrayList<ArrayList<byte[]>> floppyDisk = new ArrayList<>();

        /**
         * 初始化一个磁盘面的所有柱面
         */
        for (int i = 0; i < CYLINDER_COUNT; i++) {
            floppyDisk.add(initCylinder());
        }

        return floppyDisk;
    }

    /**
     * 初始化一个柱面的所有扇区
     * @return 扇区内容
     */
    private ArrayList<byte[]> initCylinder(){
        ArrayList<byte[]> floppySector = new ArrayList<>();

        //一个柱面有18个扇区，并且是从1开始计数
        for (int i = 0; i < SECTORS_COUNT; i++) {
            byte[] sector = new byte[SECTOR_SIZE];
            floppySector.add(sector);
        }

        return floppySector;
    }
}