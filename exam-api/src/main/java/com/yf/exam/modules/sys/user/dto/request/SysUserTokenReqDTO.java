package com.yf.exam.modules.sys.user.dto.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
* <p>
* 会话检查请求类
* </p>
*
* @author 程佳诺
* @since 2023-06-08 16:57
*/
@Data
@ApiModel(value="会话检查请求类", description="会话检查请求类")
public class SysUserTokenReqDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户名", required=true)
    private String token;
    
}
