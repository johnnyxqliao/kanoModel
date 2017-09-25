package xjtu.dao;

public class User {
	private String category;
	private String charmNeed;
	private String expectNeed;
	private String basicNeed;
	private String indifferentNeed;
	private String reverseNeed;
	private String problem;
	private String result;

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCharmNeed() {
		return charmNeed;
	}

	public void setCharmNeed(String charmNeed) {
		this.charmNeed = charmNeed;
	}

	public String getExpectNeed() {
		return expectNeed;
	}

	public void setExpectNeed(String expectNeed) {
		this.expectNeed = expectNeed;
	}

	public String getBasicNeed() {
		return basicNeed;
	}

	public void setBasicNeed(String basicNeed) {
		this.basicNeed = basicNeed;
	}

	public String getIndifferentNeed() {
		return indifferentNeed;
	}

	public void setIndifferentNeed(String indifferentNeed) {
		this.indifferentNeed = indifferentNeed;
	}

	public String getReverseNeed() {
		return reverseNeed;
	}

	public void setReverseNeed(String reverseNeed) {
		this.reverseNeed = reverseNeed;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String toString() {
		System.out.println("连接成功1");
		return "User： category=" + category + ", charmNeed=" + charmNeed + ", expectNeed=" + expectNeed + ", basicNeed="
				+ basicNeed + ", indifferentNeed=" + indifferentNeed + ", reverseNeed=" + reverseNeed + ", problem="
				+ problem + ", result=" + result;
	}
}
