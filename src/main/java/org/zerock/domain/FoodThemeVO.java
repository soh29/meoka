package org.zerock.domain;

import lombok.Data;

@Data
public class FoodThemeVO {
	private Integer foodNo;
	private Integer themeNo;

	private String foodName;
	private String themeType;
	private String themeName;
}
