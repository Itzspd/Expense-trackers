//Mapping of widgets.
    syntax(_List_.map((name) {return widget}).toList())

/*String interpolation is the process of insering variable values into
     placeholders in a string literal.To concatenate strings in dart,
    we can use string interpolation (syntax ${}) or using +.
    //Note, usng ${} changes a variable to a string i.e no toString().
 */

//Using the intl package to format our date.
//Note, read the flutter docs for intl.

//making the screen scrollable.
1. ListView,singlechildscrollView,ListView.builder

//In a statefull widget, they are two classes, the widget and the state classe
//To access the properties of the widget class in the state class, we use (widget.(widget property))

//In theme in the materialapp tree
//theme: themedata()
/*Note primarycolor and primaryswatch are different.primaryswatch gives 
 different shades of one color while primarycolor gives only one color.
*/

//Udemy number 97 texttheme styles for text

//Flexible and Expanded are used to fit the row and column in terms of how much space they should occupy.
//Flexible: fit : Flexfit.tight will give the column or row all the renainig space available
//Default is Flexfit.loose

//Note ,Expanded is simply Flexible fit with Flexfit.tight