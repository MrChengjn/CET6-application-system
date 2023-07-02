package com.yf.exam.modules.sys.user.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.modules.sys.user.dto.SysRoleDTO;
import com.yf.exam.modules.sys.user.entity.SysRole;
import com.yf.exam.core.api.dto.PagingReqDTO;

/**
* <p>
* 角色业务类
* </p>
*
* @author 程佳诺
* @since 2023-06-04 16:57
*/
public interface SysRoleService extends IService<SysRole> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<SysRoleDTO> paging(PagingReqDTO<SysRoleDTO> reqDTO);
}
