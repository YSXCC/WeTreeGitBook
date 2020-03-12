#include "to_hex_str.h"

static char keyval[5] = {'0', 'X', 0, 0, 0};    //变换十六进制数组

char charToHexVal(char c){  //返回的是ASCII码
    if(c >= 10){
        return 'A' + c - 10;
    }else{
        return '0' + c;
    }
}

char* charToHexStr(unsigned char c){
    int i = 0;
    char mod = c % 16;
    keyval[3] = charToHexVal(mod);
    c = c / 16;
    keyval[2] = charToHexVal(c);
    return keyval;
}

char* intToHexStr(unsigned int data){
    static char str[11];
    str[0] = '0';
    str[1] = 'X';
    str[10] = 0;

    int i = 2;
    for(; i < 10; i++) {
        str[i] = '0';
    }

    int p = 9;
    while(p > 1 && data > 0){
        int tmp = data % 16;
        data = data / 16;
        if(tmp >= 10){
            str[p] = 'A' + tmp  -10;
        }else{
            str[p] = '0' + tmp;
        }
        p--;
    }
    return str;
}