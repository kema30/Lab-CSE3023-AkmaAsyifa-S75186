
package com.lab.bean;

import java.io.Serializable;

public class SubjectBean implements Serializable {
    private int id;
    private String matricNo;
    private String subjectCode;
    private String subjectName;

    // Default constructor
    public SubjectBean() {}

    // Getters and Setters
    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }

    public String getMatricNo() { 
        return matricNo; 
    }
    public void setMatricNo(String matricNo) { 
        this.matricNo = matricNo; 
    }

    public String getSubjectCode() { 
        return subjectCode; 
    }
    public void setSubjectCode(String subjectCode) { 
        this.subjectCode = subjectCode; 
    }

    public String getSubjectName() { 
        return subjectName; 
    }
    public void setSubjectName(String subjectName) { 
        this.subjectName = subjectName; 
    }
}
