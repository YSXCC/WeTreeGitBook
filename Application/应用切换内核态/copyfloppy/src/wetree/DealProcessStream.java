package wetree;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class DealProcessStream extends Thread {
    private InputStream inputStream;

    public DealProcessStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    @Override
    public void run() {
        InputStreamReader inputStreamReader = null;
        BufferedReader bReader = null;
        try {
            inputStreamReader = new InputStreamReader(inputStream);
            bReader = new BufferedReader(inputStreamReader);
        //     打印信息
        //    String line = null;
        //    while ((line = bReader.readLine()) != null) {
        //        System.out.println(line);
        //    }
        //     不打印信息
           while (bReader.readLine() != null);
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }finally {
            try {
                bReader.close();
                inputStreamReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}