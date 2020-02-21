# JAVA转换字体为汇编的inc文件

## 代码实现

```java
public class MakeFont{
    private String fontFilePath;
    File file = new File("fontData.inc");   //生成汇编的配置文件
    FileWriter fileWriter = null;

    public MakeFont(String fontFilePath){
        this.fontFilePath = fontFilePath;
        try{
            //获取File的写权限，并且是append模式
            fileWriter = new FileWriter(file.getName(), true);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void makeFont(){
        try {
            String Encoding = "GBK";
            File file = new File(fontFilePath);
            if(file.isFile() && file.exists()){
                fileWriter.write("systemFont:\n");

                InputStreamReader read = new InputStreamReader(new FileInputStream(file),Encoding);
                BufferedReader bufferedReader = new BufferedReader(read);

                String lineText = null;
                while((lineText = bufferedReader.readLine()) != null){
                    if(lineText.contains("char")){
                        writeFontBinary(bufferedReader);
                    }
                }
                fileWriter.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void writeFontBinary(BufferedReader bufferedReader) throws IOException{
        int lineCount = 16;     //8x16矩阵构成一个字体
        fileWriter.write("db ");

        while(lineCount > 0){
            String lineText = bufferedReader.readLine();
            byte b = 0;
            for (int i = 0; i < 8; i++) {
                if(lineText.charAt(i) == '*'){
                    b |= (1 << (7-i));
                }
            }
            lineCount--;
            StringBuilder str = new StringBuilder();
            str.append("0").append(Integer.toHexString(b & 0xFF)).append("H");  
            if(lineCount > 0){
                str.append(" ,");
            }
            String result = str.toString();
            fileWriter.write(result);
        }
        fileWriter.write("\n");         //inc文件中，一行为一个字体
    }
    public static void main(String[] args) {
        MakeFont makeFont = new MakeFont("font.txt");
        makeFont.makeFont();
        System.out.println("Make Font Success!");
    }
}
```
