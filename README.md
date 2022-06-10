![DEPRECATED](https://img.shields.io/badge/-DEPRECATED-red)

## Source published
This repository will not be used anymore. Please look at [AJUI_Breadcrumb_source](https://github.com/AJARProject/AJUI_Breadcrumb_source).

---
---
---

# AJUI_Breadcrumb

AJUI Breadcrumb is a component made for 4D that help you to create and display breadcrumb in your forms. You can fully customize your breadcrumbs and have templates to easily use the same style everywhere in your application.

A breadcrumb is created via the language and will be displayed in a picture element in your form. The breadcrumb is stored in an object that is an instance of a breadcrumb.

### AJUI components library

[AJUI_Library](https://github.com/AJARProject/AJUI_Library)

### Documentation

[Wiki AJUI_BreadCrumb](https://github.com/AJARProject/AJUI_Breadcrumb/wiki)

**Example**

```4d
    Case of
      : (Form event=On Load)
        Form.bc:=New AJUI_BreadCrumb

        Form.bc.Name("BreadCrumb")

        Form.bc.AddSection("sect_home";New object("label";"Home"))
        Form.bc.AddSection("sect_products";New object("label";"Products"))
        Form.bc.AddSection("sect_customers";New object("label";"Customers"))
        Form.bc.AddSection("sect_contact";New object("label";"Contact"))
    End case

    Form.bc.Draw()
```

### Version

1.2.3-Build39  // Wed, 29 Jul 2020 07:27:21 GMT

Minimal 4D Version : 
 - 18 (using formula member function)
 - 18 R3 (using class)

### Questions?

If you have any question, you can ask them directly on github or write to info@ajar.ch
