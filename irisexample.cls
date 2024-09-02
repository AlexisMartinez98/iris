Class iris.example Extends %Persistent
{

Property name As %String(MAXLEN = 10);

Property age As %String(MAXLEN = 3);

Storage Default
{
<Data name="exampleDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>age</Value>
</Value>
</Data>
<DataLocation>^iris.exampleD</DataLocation>
<DefaultData>exampleDefaultData</DefaultData>
<IdLocation>^iris.exampleD</IdLocation>
<IndexLocation>^iris.exampleI</IndexLocation>
<StreamLocation>^iris.exampleS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
