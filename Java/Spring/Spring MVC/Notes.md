# Understanding Spring MVC

The part of the Spring framework that enables you to develop web applications that serve HTTP requests.

---

- Flexible when compared to other web development models.
- Can leverage the features of Core Spring
  - Inversion of Control
  - Dependency Injection
- Based on Model-View-Controller Architecture

## Spring MVC Process Flow

- Incoming Request -> `Front Controller` -> Delegating request -> `Controller` (Handle request, create model if required) -> Delegates the rendering of response along with the response back to the `Front Controller` -> **Optional** Send the rendering request to the view template -> Relevant view template returns the control to the `Front Controller` **Optional End** -> Will provide the response to the client.

- All of this happens in a `servlet container` a.k.a `servlet engine` (e.g. Tomcat).

## ApplicationContext

- `<context:component-scan base-package="com.springmvc" />`: this statement basically scans the package for any special Spring beans makes them available

- `<mvc:annotation-driven />`: supports conversion formatting and validations.

> **_NOTE:_** Inorder to work with Spring MVC, we need to have **common-logging** jar files.

## Steps for creating a Spring Controller

1. Create a `Controller` Class: Use the `@Component` annotation which inherits fro the `@Component` annotation.

2. Define a Controller Method.
3. Add `RequestMapping`s to Controller Method.

```
@Controller
public class HomeController {

  @RequestMapping("/")
  public String homePage() {
    return HomePage; //--> this statement will automatically search for HomePage.jsp view
  }

}
```

## Spring Model

- Spring model is just a container for your application data.

```
@Controller
public class HomeController {

  @RequestMappings("/save")
  public String saveData(HttpServletRequest request, Model model) { // --> model will hold your form data
    String name = request.getParameter("name");
    ...
    model.addAttribute(name, value); // --> attribute can be directly used by .jsp pages using {attributeName}.
    return confirm;
  }

}
```

## Handling Request Parameters

- `@RequestParam`: Allows you to read form data and automatically bind it to a paramater coming into your method. Pick the query string present in the URL, separated by `?`.

```
@Controller
public class AccountController {
  @RequestMapping("/saveAccount")
  public String saveAccount(Model model,
    @RequestParam("accountNo") String acNo,
    @RequestParam("accountHolderName") String name,
    @RequestParam("balance") String balance ) {
      ... // method body
    }
}
```

## Handling Request Mappings

- **Controller-Level Request Mapping:** We can define request mapping at the controller level. It basically serves like a parent mapping for the controller.

> **_NOTE:_** Request Mappings on the methods are relative to the Controllers path.

```
@Controller
@RequestMapping("/home")
public class HomeController {

  @RequestMapping("/index")
  public String index() {
    return "index"; //--> in order to invoke index.jsp, we have to use "localhost:8080/home/index"
  }

}
```

- We can use the **value** attribute of the @RequestMapping to allow same method to handle multiple URL requests.

```
@Controller
@RequestMapping("/home")
public class HomeController {

  @RequestMapping(value={"", "/index"})
  public String index() {
    return "index"; //--> in order to invoke index.jsp, we have to use "localhost:8080/home/index"
  }

}
```

- We can handle **dynamic urls** with using `@PathVariable` annotation. Pick part of the URL separated by `/`.

```
@Controller
@RequestMapping("/test")
public class TestController {

  @RequestMapping(value="/dynamic/{userName}")
  public String dynamicUrl(@PathVariable("userName") String userName) {
    return "testRequestMapping";
  }

}
```
