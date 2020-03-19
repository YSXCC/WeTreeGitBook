package wetree;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;

public class MakeBinaryBoot {
    public void compilerBootAsmToBinary() {
        File file = new File("boot.bat");
        if (file.exists()) {
            file.delete();
        }
        String command = "nasm boot.asm -o boot.bat";

        try {
            Process process = Runtime.getRuntime().exec(command);
            readProcessOutput(process);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void readProcessOutput(Process process) {
        readOutput(process.getInputStream(), System.out);
        readOutput(process.getErrorStream(), System.err);
    }

    public void readOutput(InputStream process, PrintStream out) {
        BufferedReader bReader = new BufferedReader(new InputStreamReader(process));
        String info;
        try {
            while ((info = bReader.readLine()) != null) {
                out.println(info);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            try {
                process.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    
}