package com.yf.exam.modules.sys.config.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.modules.sys.config.dto.SysConfigDTO;
import com.yf.exam.modules.sys.config.entity.SysConfig;

/**
* <p>
* 通用配置业务类
* </p>
*
* @author 程佳诺
* @since 2023-06-11 09:12
*/
public interface SysConfigService extends IService<SysConfig> {

    /**
     * 查找配置信息
     * @return
     */
    SysConfigDTO find();
}
