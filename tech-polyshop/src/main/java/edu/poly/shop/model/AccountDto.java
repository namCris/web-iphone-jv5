package edu.poly.shop.model;

import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountDto {
	@NotEmpty
	private String username;
	@NotEmpty
	private String password;
	
	private Boolean isEdit = false;
}
