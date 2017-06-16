package database.Module;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "Module")
public class Module {
	private int idModule;
	private String name;

	private boolean sub = false;

	public Module() {}
	public Module(int idModule, String name) {
		this.idModule = idModule;
		this.name = name;
	}
	public Module(String name) {
		this.name = name;
	}
	public int getIdModule() {
		return idModule;
	}
	public void setIdModule(int idModule) {
		this.idModule = idModule;
	}

	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public boolean getSub() {
		return this.sub;
	}

	public void setSub(boolean sub) {
		this.sub = sub;
	}
}