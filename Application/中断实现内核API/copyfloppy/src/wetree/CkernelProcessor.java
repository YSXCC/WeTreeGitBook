package wetree;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


public class CkernelProcessor {

    private BufferedReader fileReader;
    private StringBuffer sBuffer;

    public CkernelProcessor() {
        try {
            // 先删除文件目录下的kernel.bat
            File file = new File("kernel.bat");
            if (file.exists()) {
                file.delete();
            }
            // 初始化sBuffer
            fileReader = new BufferedReader(new FileReader("ckernel_temp.asm"));
            File ckernelFile = new File("ckernel_temp.asm");
            sBuffer = new StringBuffer((int) ckernelFile.length());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    /**
     * 去除掉asm文件中的global,extern,section
     */
    public void process() {
        String lineText = null;
        try {
            while ((lineText = fileReader.readLine()) != null) {
                String line = lineText.toLowerCase();
                if (line.contains("global") || line.contains("extern") || line.contains("section")) {
                    continue;
                }
                // System.out.println(lineText);
                // windows下面的回车式的换行符号是"\r\n"
                sBuffer.append(lineText).append("\r\n");
            }

            fileReader.close();
            BufferedWriter bReader = new BufferedWriter(new FileWriter("ckernel.asm"));
            bReader.write(sBuffer.toString());
            bReader.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void createCkernelAsmToBinary() {
        try {
            Process process = Runtime.getRuntime().exec("nasm kernel.asm -o kernel.bat");
            readProcessOutput(process);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void readProcessOutput(Process process) {
        new DealProcessStream(process.getInputStream()).start();
        new DealProcessStream(process.getErrorStream()).start();
    }
}
