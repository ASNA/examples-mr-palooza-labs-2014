ASNApalooza Lab Registration Mobile RPG app
---


>
> This document is in progress!
> 

The ASNApalooza Lab Registration app was written with ASNA Mobile RPG and ILE RPG. 

It serves as a testbed for a few concepts and ideas I've been working on with Mobile RPG and ILE RPG, including: 
  
  * Each record format uses a protected, input-only field to indicate to the RPG program what record was most recently read.  
  * Each record format uses the CursorField property to associate an "action" field with this record format. MR's input controls populate this value with their' FieldName. These two fields provide an alternative to using function keys and response indicators to determine application action. More on this technique below.
  * It uses embedded SQL exclusively in the RPG program. I chose this mostly because I wanted to create a quick environment for [creating database migrations](http://rails-guides.joefiorini.com/migrations.html) (a concept I first used several years ago with Ruby on Rails). Make no mistake, this is a poor man's database migration scheme at best, but it did save me time and trouble.

Here are the six record formats the lab registration program uses:

![](http://i.imgur.com/tEYt6Nb.png)

![](http://i.imgur.com/BZ5S70i.png)

![](http://i.imgur.com/HEhv9HC.png)

![](http://i.imgur.com/zdYa5HD.png)

![](http://i.imgur.com/uKgbM7z.png)

![](http://i.imgur.com/3CThK00.png)

### Function keys be gone!
    
This program uses some interesting conventions to control program flow. My goal was to be able to write the program logic linking the UI to the RPG program without any function keys, response indicators, or using the INFDS. 

To understand how the program manages this, take a look at the (substantially) abridged MR record format below.

Each record format in the Palooza Lab registration program defines three things: 
  1. The CursorField attribute is defined as `CAction` in the record format description. 
  2. An input/output field named CAction is declared, as defined in the previous bullet. This is a none-display field. 
  3. An input-only field named CFormat is declared and its value set to the alias of its parent record format. This is a non-display field. 

All DdsButtons in the app assign a value to the `FieldName` property. This value specifies an action that the RPG program should perform when the button is tapped. This property is designed to work with the `CAction` field to tell the RPG the field name containing the name of the field where the cursor was located when the record format was returned to the RPG program. 

With a little trial and error, though, I learned that that `FieldName` property is really a little more powerful that it first seems. When a DDsButton defines a `FieldName` value, that property's value is returned to the RPG program in the `CAction` field. The program isn't using this value for anything to do with field names! Rather, it it is using to know what action was requested. In the case of the buttons below, one requests a `REGISTER` action, and one requests a `RETURNING` action, and one requests an `END` action.     

Note also that all of the buttons are associated with the F3 `AidKey`. All of the buttons in the program are associated with F3! That's because they each need an `AidKey` to report input to the RPG program, but I don't care which key was pressed. The program uses the `CAction` field to see what action is required.

Remember that the `FieldName` property, in this case, isn't a field name! It's the name of an action to perform. You'll notice that I've defined the `CAction` field as being 32 characters long. This means the `FieldName` property can be long enough to be meaningful. When I first started doing this, I assumed the RPG/Display file model wouldn't allow a very long field name. Turns out, they don't care! Use a long action name!  

    <mdf:DdsRecord Alias="HOMEMENU" FuncKeys="F3 03;" CursorField="CAction" >
        <mdf:DdsCharField Alias="CAction"
            DefaultValue=""
            Length="32"
            Usage="Both"
            VisibleCondition="*False" />
    
        <mdf:DdsCharField Alias="CFormat"
            DefaultValue="HOMEMENU"
            Length="10"
            Protect="*True"
            Usage="InputOnly"
            VisibleCondition="*False" />
    
        <mdf:DdsButton AidKey="F3" Text="New Registration" FieldName="REGISTER" />
        <mdf:DdsButton AidKey="F3" Text="Registered - Show Labs" FieldName="RETURNING"/>
        <mdf:DdsButton AidKey="F3" Text="End" FieldName="END"/>
    </mdf:DdsRecord>    

These fields allow the RPG program to easily determine what record format was just read (`CFormat`) and what action was requested (`CAction`) for that format. Notice that the F3 function is simply ignored! The program doesn't need to know, nor does it care, what function key was pressed.  
     
    // Show the first panel.
    ExFmt HomeMenu
    
    DoW CAction <> 'END';
      Select;
        When CFormat = 'HOMEMENU';
          Select;
            When CAction = 'REGISTER';
              // Do logic for 'REGISTER' action.
            When CAction = 'RETURNING';
             // Do Logic for 'RETURNING' action.
          EndSl;
      EndSl;            
    EndDo;
    
    *INLR = *On;
    Return;

When you look at the production, you'll notice that's program logic select statement is much larger; however is it doing exactly what the simple example shows above. 

My goal was to write the logic linking the UI to the RPG program without any function keys, response indicators, or using the INFDS. I succeeded everywhere but with buttons inside subfiles. There, you'll notice as you're reading the programs real code I did have to resort to using a response indicator.



> To be continued 
