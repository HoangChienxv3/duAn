package com.mamilove.request.dto;

import java.util.List;

import com.mamilove.entity.Account;
import com.mamilove.entity.Product;
import com.mamilove.entity.Property;
import com.mamilove.entity.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuantityDto {
	private List<Product> product;
	
	private Property property;
	
	private Size size;
	
	private Double quantity; 
}
