package com.classroom.mapper;

public interface BaseMapper<T>{
	public void save(T t);
	
	public void delete(int t);

	public void update(T t);

	public T getById(int id);

}
