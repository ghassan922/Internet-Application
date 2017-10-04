/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Vector;

/**
 *
 * @author gh-jr
 */
public class Course {

    private Vector<Student> students ;
    private String id ;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    
    public Course() {
        this.students = new Vector<>();
    }
    public void AddStudent(Student s){
        this.students.add(s);
    }
    public Vector<Student> getStudents() {
        return this.students;
    }
    
}
