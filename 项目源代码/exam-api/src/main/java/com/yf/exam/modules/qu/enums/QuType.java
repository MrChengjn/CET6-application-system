package com.yf.exam.modules.qu.enums;


/**
 * 题目类型
 * @author 朱梓豪
 * @date 2023-06-02 13:11
 */
public interface QuType {

    /**
     * 单选题
     */
    Integer RADIO = 1;

    /**
     * 多选题
     */
    Integer MULTI = 2;

    /**
     * 判断题
     */
    Integer JUDGE = 3;
    
}
