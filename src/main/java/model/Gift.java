package model;

public class Gift {
	private int id;
	private String name;
	private String type;
	private float neededPoint;
	private String condition;
	private String description;
	
	public Gift() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public float getNeededPoint() {
		return neededPoint;
	}

	public void setNeededPoint(float neededPoint) {
		this.neededPoint = neededPoint;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
