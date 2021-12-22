%macro colon 2

%2:
	%ifdef element
		dq element
	%else
		dq 0
	%endif
	db %1, 0
	%define element %2
%endmacro
