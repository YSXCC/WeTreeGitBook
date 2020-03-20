package wetree;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

public class AppProcessor {

    // 用来装需要处理的应用文件名
    private List<String> appFileName;
    private StringBuffer appBuffer;
    private BufferedReader appReader; // 写文件
    
    private List<String> appEndFileName = new ArrayList<>();

    public AppProcessor() {
    }

    public AppProcessor(ArrayList<String> appFileNameList) {
        this.appFileName = appFileNameList;
    }

    public void process(){
        for (String appAsmName : appFileName) {
            File file = new File(appAsmName);
            try {
                appReader = new BufferedReader(new FileReader(file));
                processAsmFile(appAsmName);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }
    }

    /*
     * 去除掉asm文件中的global,extern,section
     */
    public void processAsmFile(String appFileName){
        String lineText = null;
        appBuffer = new StringBuffer((int)new File(appFileName).length());
        try {
            while ((lineText = appReader.readLine()) != null) {
                String line = lineText.toLowerCase();
                if (line.contains("global") || line.contains("extern") || line.contains("section")) {
                    continue;
                }
                appBuffer.append(lineText).append("\r\n");
            }

            appReader.close();
            int end = appFileName.indexOf("_");
            String endFileName = appFileName.substring(0, end) + ".asm";
            appEndFileName.add(endFileName);
            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(endFileName));
            bufferedWriter.write(appBuffer.toString());
            bufferedWriter.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void createAppAsmToBinary(){
        try {
            Process process = Runtime.getRuntime().exec("nasm api_call.asm -o hlt.bat");
            readProcessOutput(process);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void readProcessOutput(Process process) {
        new DealProcessStream(process.getInputStream()).start();
        new DealProcessStream(process.getErrorStream()).start();
    }
}