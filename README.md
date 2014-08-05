# PickerHandler

A custom UI class for working with UIPickerViews and TextField input. This project was born from a form-app I was writing, where I had to write several UIPickerViews to cover user input like gender, hair color, etc.

## Initialize
Pretty simple: provide a UITextField and an array of values 
```
PickerHandler *pickerHandler = [[PickerHandler alloc] initWithTextField:textField
							objects:@[@"first",@"second",@"third"]];
```
You may also provide a complex array (an array of arrays) to designate multiple columns (day, month and year for a date picker, for example).
PickerHandler takes care of adjusting the keyboard and populating the text of the text field.

## Optional: Format String
You may supply a format string , using the `formatString` property on the `PickerHandler`. This string is used to format the value of each component into a final string. For example,
```
[pickerHandler setFormatString:"%@ is my first value, %@ is my second"];
```

would output (for input1 and input2): "input1 is my first value, input2 is my second". of course, this can be used in conjunction with ordering and string formatting
```
[pickerHandler setFormatString:"%2$@ is my second value, %1$@ is my first"];
```
would output (for input1 and input2): "input2 is my second value, input1 is my first".

