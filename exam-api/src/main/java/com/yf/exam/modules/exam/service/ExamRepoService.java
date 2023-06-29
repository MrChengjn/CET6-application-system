package com.yf.exam.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.modules.exam.dto.ext.ExamRepoExtDTO;
import com.yf.exam.modules.exam.entity.ExamRepo;

import java.util.List;

/**
* <p>
* 考试题库业务类
* </p>
*
* @author 朱梓豪
* @since 2023-06-04 11:14
*/
public interface ExamRepoService extends IService<ExamRepo> {


    /**
     * 保存全部
     * @param examId
     * @param list
     */
    void saveAll(String examId, List<ExamRepoExtDTO> list);

    /**
     * 查找考试题库列表
     * @param examId
     * @return
     */
    List<ExamRepoExtDTO> listByExam(String examId);

    /**
     * 清理脏数据
     * @param examId
     */
    void clear(String examId);

}
