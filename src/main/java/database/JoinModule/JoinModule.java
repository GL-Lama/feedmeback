package database.JoinModule;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "JoinModule")
public class JoinModule {
	private int idModule;
	private int idStudent;
	private int idJm;

	public JoinModule() {}
	public JoinModule(int idJm, int idModule, int idStudent) {
		this.idModule = idModule;
		this.idStudent = idStudent;
		this.idJm = idJm;
	}

	public int getIdJm() {
		return idJm;
	}

	public void setIdJm(int idJm) {
		this.idJm = idJm;
	}

	public int getIdModule() {
		return idModule;
	}

	public void setIdModule(int idModule) {
		this.idModule = idModule;
	}

	public int getIdStudent() {
		return this.idStudent;
	}

	public void setIdStudent(int idStudent) {
		this.idStudent = idStudent;
	}
}