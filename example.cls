Class iris.example Extends %CSP.REST
{

XData UrlMap
{
<Routes>
     <Route Url="/create" Method="POST" Call="PostCreate"/>
    <Route Url="/user" Method="GET" Call="GetUser"/>
</Routes>
}

ClassMethod GetUser() As %String
{
    set query = " SELECT * FROM iris.example"
    set rs = ##class(%SQL.Statement).%ExecDirect(,query) 

    set list = []
   
    Do %response.SetHeader("Access-Control-Allow-Origin", "*")
    Do %response.SetHeader("Content-Type", "application/json")
    
    while rs.%Next(){
        set row = {
            "Name": (rs.%Get("Name")),
            "Age": (rs.%Get("Age"))
        }
    do list.%Push(row)
    }
    set result = {
        "result": (list.%Size()),
        "items": (list)
    }
    Write result.%ToJSON()
    Quit $$$OK
}

ClassMethod PostCreate() As %Status
{
      Do %response.SetHeader("Access-Control-Allow-Origin","*")
    
        Set json = %request.Content.Read()
        
        Set obj = ##class(%DynamicObject).%FromJSON(json)

        
        Set name = obj.name
        Set age = obj.age
        
        If (name = "" || age = "") {
            Write "Faltan parámetros: name o age", !
           Return "Error"
        }

        Set user = ##class(iris.example).%New()
        Set user.Name = name
        Set user.Age = age
        
        Set status = user.%Save()
        If $$$ISERR(status) {
            Write "Error al guardar el usuario.", !
           Return "Error"
        }

        Write "Usuario creado exitosamente.", !
        Return obj
}

}
