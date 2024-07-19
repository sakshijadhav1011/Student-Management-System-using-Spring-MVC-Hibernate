package com.sakshi.dao;

import java.util.List;

import com.sakshi.entity.Student;

public interface StdDao {
	public int saveStd(Student std);

	public Student getStdById(int id);

	public List<Student> getAllStd();

	public void update(Student std);

	public void deleteStd(int id);

	public Student getStdByName(String name);
}
