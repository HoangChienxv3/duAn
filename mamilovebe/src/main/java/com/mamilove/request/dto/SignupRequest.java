package com.mamilove.request.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.util.List;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignupRequest {

    @NotNull(message = "Không được để trống")
    private String username;
    @NotNull(message = "Không được để trống")
    @Email(message = "Sai định dạng email")
    private String email;
    @NotNull(message = "Không được để trống")
    @Length(min = 6, message = "Tối thiểu mật khẩu phải 6 ký tự")
    private String password;
    private String phone;
    private List<String> role;
}
