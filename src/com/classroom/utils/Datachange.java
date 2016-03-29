package com.classroom.utils;

import java.lang.reflect.Field;

public class Datachange {
	
	
	/**
	 * 判断对象所有属性是否null
	 * @return
	 */
	public static boolean isfeild(Object obj) {
		int legth=obj.getClass().getDeclaredFields().length;
		int count=0;
		for (Field f : obj.getClass().getDeclaredFields()) {
		    f.setAccessible(true);
		    try {
				if (f.get(obj) == null) { //判断字段是否为空，并且对象属性中的基本都会转为对象类型来判断
				   count++;
				}
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count==legth? false: true;
		
	}

}
