package com.offcn.utils;

import org.springframework.util.DigestUtils;

/**
 * @BelongsProject: springmvc
 * @BelongsPackage: com.offcn.utils
 * @Author: shifengyuan
 * @Description: MD5加密工具类
 */
public class MD5Util {

    /**
     * 使用Spring的DigestUtils对密码进行MD5加密
     * @param password
     * @return md5加密后的结果
     */
    public static String md5Encode(String password){
        String md5Password =
                DigestUtils.md5DigestAsHex(password.getBytes());
        return md5Password;
    }

}
