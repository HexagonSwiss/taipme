package org.whitepaper.web.common;

public class GenericListItem implements ListItem {

	private final String value ;
	private final String label ;

	public GenericListItem(String value, String label) {
		super();
		this.value = value;
		this.label = label;
	}

	@Override
	public String getValue() {
		return value;
	}

	@Override
	public String getLabel() {
		return label;
	}

}
