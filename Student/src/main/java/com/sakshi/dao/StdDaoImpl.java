package com.sakshi.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Component;

import com.sakshi.entity.Student;

import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

@Component
public class StdDaoImpl implements StdDao {


	Configuration configuration;
	SessionFactory sessionFactory;
	Session session;
	
	public StdDaoImpl() {
		this.session = new Configuration()
				.configure()
				.addAnnotatedClass(Student.class)
				.buildSessionFactory()
				.openSession();
	}
	@Override
	public int saveStd(Student std) {
		session.beginTransaction();
        int rowsUpdated = (int) session.save(std);
        session.getTransaction().commit();
        return rowsUpdated;
	}

	public int saveEmp2(Student std) {
		try {
			session.beginTransaction();
			Serializable id = (Serializable) session.save(std); // Save the entity and get its ID
			session.getTransaction().commit();

			if (id != null) {
				return 1; // A single row was updated (the entity was saved)
			} else {
				return 0; // No rows were updated
			}
		} catch (Exception e) {
			// Handle any exceptions here
			session.getTransaction().commit();
			throw e;
		}
	}

	@Override
	public Student getStdById(int id) {
		 session.beginTransaction();
	        Student std = session.get(Student.class, id);
	        session.getTransaction().commit();
	        return std;
	}

	@Override
	public List<Student> getAllStd() {
		  session.beginTransaction();
	        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
	        CriteriaQuery<Student> criteriaQuery = criteriaBuilder.createQuery(Student.class);
	        Root<Student> root = criteriaQuery.from(Student.class);
	        criteriaQuery.select(root);

	        List<Student> stdList = session.createQuery(criteriaQuery).getResultList();
	        session.getTransaction().commit();
	        return stdList;
	}
	
	public List<Student> getAllStd2() {
		List<Student> std = new ArrayList<>();
		try {
			session.beginTransaction();

			String hql = "FROM students";
			Query query = session.createQuery(hql);
			std = query.getResultList();

			session.getTransaction().commit();
		} catch (Exception e) {
			if (session.getTransaction() != null) {
				session.getTransaction().commit();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}

		return std;
	}

	@Override
	public void update(Student std) {
		session.beginTransaction();
        session.merge(std);
        session.getTransaction().commit();
	}

	@Override
	public void deleteStd(int id) {
		session.beginTransaction();
        Student stdToDelete = session.get(Student.class, id);
        if (stdToDelete != null) {
            session.delete(stdToDelete);
        }
        session.getTransaction().commit();
	}

	@Override
	public Student getStdByName(String name) {
		 try {
		        session.beginTransaction();
		        String sql = "SELECT * FROM student WHERE name = :name";
		        NativeQuery<Student> query = session.createNativeQuery(sql, Student.class);
		        query.setParameter("name", name);
		        Student std = query.getSingleResult();
		        session.getTransaction().commit();
		        return std;
		    } catch (NoResultException e) {
		        // Handle the case where no employee with the given name was found.
		        return null; // or throw a custom exception or return a default value
		    } catch (Exception e) {
		        // Handle other exceptions, such as database connection issues, etc.
		        e.printStackTrace(); // You can log or handle the exception accordingly
		        session.getTransaction().commit();
		    }
		    return null;
	}

}
