<%==SIM:UserInput:IndentationSize=Number("Indentation size",4)==%>
<%==SIM:UserInput:IndentationChar=Choice("Indentation char",Space,Tab)==%>
<%==SIM:If:Eq(IndentationChar,"Tab")==%><%==SIM:SetTabIndent==%><%==SIM:Else==%><%==SIM:SetSpaceIndent==%><%==SIM:EndIf==%><%==SIM:IndentSize(IndentationSize)==%>
library <%==SIM:Element.Namespace==%>;<%==SIM:Line==%>

<%==SIM:ExplicitWhitespacesOn==%>
<%==SIM:AutoIndentOn==%>

<%==SIM:Set:private=_==%>
<%==SIM:Set:protected===%>
<%==SIM:Set:package===%>
<%==SIM:Set:public===%>

<%==SIM:ForEach:Imports==%>
    import <%==SIM:Import.Name==%>;
    <%==SIM:Line==%>
<%==SIM:EndFor==%>
<%==SIM:Line==%>


<%==SIM:ForEach:Element.DocumentationLines==%>
    //<%==SIM:DocumentationLine==%>
    <%==SIM:Line==%>
<%==SIM:EndFor==%>
    
    
mixin <%==SIM:Element.Visibility==%><%==SIM:Element.Name==%>
    
<%==SIM:If:Element.HasTemplateParameters==%><<%==SIM:ForEach:Element.TemplateParameters==%>
        <%==SIM:Parameter.Name==%>
        <%==SIM:IfNot:IsLastItem==%>, <%==SIM:EndIf==%>
    <%==SIM:EndFor==%>><%==SIM:EndIf==%>
<%==SIM:If:Element.HasTemplateParameterWithKind==%>
    <%==SIM:ForEach:Element.TemplateParameters==%>
        <%==SIM:If:Parameter.HasKind==%> where <%==SIM:Parameter.Name==%> : <%==SIM:Parameter.Kind==%> <%==SIM:EndIf==%>
    <%==SIM:EndFor==%>
<%==SIM:EndIf==%>

<%==SIM:If:Element.HasDependencies("restrict")==%> on <%==SIM:ForEach:Element.Dependencies("restrict")==%><%==SIM:Dependency.Name==%><%==SIM:IfNot:IsLastItem==%>, <%==SIM:EndIf==%><%==SIM:EndFor==%><%==SIM:EndIf==%>
<%==SIM:Line==%>
{<%==SIM:StartBlock==%><%==SIM:Line==%>

    <%==SIM:ForEach:Element.AllAttributes==%>
        <%==SIM:IfNot:Attribute.HasStereotype("property")==%>
            <%==SIM:ForEach:Attribute.DocumentationLines==%>
                //<%==SIM:DocumentationLine==%>
                <%==SIM:Line==%>
            <%==SIM:EndFor==%>
                

            <%==SIM:Attribute.Visibility==%><%==SIM:If:Attribute.IsStatic==%> static<%==SIM:EndIf==%><%==SIM:If:Attribute.IsReadOnly==%> readonly<%==SIM:EndIf==%> <%==SIM:If:Attribute.IsArray==%>List<<%==SIM:Attribute.Type==%>><%==SIM:Else==%><%==SIM:Attribute.Type==%><%==SIM:EndIf==%> <%==SIM:Attribute.Name==%>
            <%==SIM:If:Attribute.HasDefaultValue==%> = <%==SIM:Attribute.DefaultValue==%><%==SIM:EndIf==%>;
            <%==SIM:IfNot:IsLastItem==%><%==SIM:Line==%><%==SIM:EndIf==%>
        <%==SIM:EndIf==%>
    <%==SIM:EndFor==%>

    <%==SIM:ForEach:Element.AllAttributes==%>
        <%==SIM:If:Attribute.HasStereotype("property")==%>
            <%==SIM:ForEach:Attribute.DocumentationLines==%>
                //<%==SIM:DocumentationLine==%>
                <%==SIM:Line==%>
            <%==SIM:EndFor==%>                
                
            <%==SIM:If:Attribute.IsStatic==%> static<%==SIM:EndIf==%> <%==SIM:If:Attribute.IsArray==%>List<<%==SIM:Attribute.Type==%>><%==SIM:Else==%><%==SIM:Attribute.Type==%><%==SIM:EndIf==%>
            get <%==SIM:Attribute.Visibility==%><%==SIM:Attribute.Name==%><%==SIM:Line==%>
            {<%==SIM:StartBlock==%><%==SIM:Line==%>                                        
                <%==SIM:Attribute.GetBody==%>
            <%==SIM:EndBlock==%><%==SIM:Line==%>
            }<%==SIM:Line==%>
                
            <%==SIM:IfNot:Attribute.IsReadOnly==%>
                set <%==SIM:Attribute.Visibility==%><%==SIM:Attribute.Name==%> (<%==SIM:If:Attribute.IsArray==%>List<<%==SIM:Attribute.Type==%>><%==SIM:Else==%><%==SIM:Attribute.Type==%><%==SIM:EndIf==%> value)<%==SIM:Line==%>
                {<%==SIM:StartBlock==%><%==SIM:Line==%>
                    <%==SIM:Attribute.SetBody==%>
                <%==SIM:EndBlock==%><%==SIM:Line==%>
                }<%==SIM:Line==%>
                <%==SIM:EndBlock==%><%==SIM:Line==%>
            <%==SIM:EndIf==%>            

            <%==SIM:IfNot:IsLastItem==%><%==SIM:Line==%><%==SIM:EndIf==%>
                
        <%==SIM:EndIf==%>
    <%==SIM:EndFor==%>

        
    <%==SIM:If:Element.HasAttributes==%><%==SIM:If:Element.HasOperations==%><%==SIM:Line(2)==%><%==SIM:EndIf==%><%==SIM:EndIf==%>

    <%==SIM:ForEach:Element.Constructors==%>            
        <%==SIM:Line==%>
        <%==SIM:If:Or(Constructor.HasDocumentation, Constructor.HasNestedDocumentation)==%>
        /// <%==SIM:Line==%><%==SIM:ForEach:Constructor.DocumentationLines==%>
        /// <%==SIM:DocumentationLine==%><%==SIM:Line==%><%==SIM:EndFor==%><%==SIM:ForEach:Constructor.Parameters==%>
        /// @param <%==SIM:Parameter.Name==%> <%==SIM:ToSingleLine(Parameter.Documentation)==%><%==SIM:Line==%>
        <%==SIM:EndFor==%><%==SIM:Line==%>
        <%==SIM:EndIf==%>

        <%==SIM:Constructor.Visibility==%><%==SIM:If:Constructor.IsStatic==%> static<%==SIM:EndIf==%> <%==SIM:Element.Name==%> (<%==SIM:ForEach:Constructor.Parameters==%><%==SIM:If:Parameter.IsArray==%>List<<%==SIM:Parameter.Type==%>><%==SIM:Else==%><%==SIM:Parameter.Type==%><%==SIM:EndIf==%> <%==SIM:Parameter.Name==%><%==SIM:IfNot:IsLastItem==%>, <%==SIM:EndIf==%><%==SIM:EndFor==%>)
        <%==SIM:Line==%>
                               
            {<%==SIM:StartBlock==%><%==SIM:Line==%>
                <%==SIM:Constructor.SourceCodeBody==%>
            
            <%==SIM:EndBlock==%><%==SIM:Line==%>
            }
            <%==SIM:IfNot:IsLastItem==%><%==SIM:Line==%><%==SIM:EndIf==%>
    
    <%==SIM:EndFor==%>
    <%==SIM:Line(1)==%>

    <%==SIM:ForEach:Element.Operations==%>
        <%==SIM:If:Operation.HasStereotype("factory")==%>
            <%==SIM:Line==%>
            <%==SIM:If:Or(Operation.HasDocumentation, Operation.HasNestedDocumentation)==%>
            /// <%==SIM:Line==%><%==SIM:ForEach:Operation.DocumentationLines==%>
            /// <%==SIM:DocumentationLine==%><%==SIM:Line==%><%==SIM:EndFor==%><%==SIM:ForEach:Operation.Parameters==%>
            ///  @param <%==SIM:Parameter.Name==%> <%==SIM:ToSingleLine(Parameter.Documentation)==%><%==SIM:Line==%>
            <%==SIM:EndFor==%><%==SIM:Line==%>
            <%==SIM:EndIf==%>                

            factory <%==SIM:Operation.Name==%> (<%==SIM:ForEach:Operation.Parameters==%><%==SIM:If:Parameter.IsArray==%>List<<%==SIM:Parameter.Type==%>><%==SIM:Else==%><%==SIM:Parameter.Type==%><%==SIM:EndIf==%> <%==SIM:Parameter.Name==%><%==SIM:IfNot:IsLastItem==%>, <%==SIM:EndIf==%><%==SIM:EndFor==%>)
            {<%==SIM:StartBlock==%><%==SIM:Line==%>
                <%==SIM:Operation.SourceCodeBody==%>
            
            <%==SIM:EndBlock==%><%==SIM:Line==%>
            }
            <%==SIM:Line==%>                
        <%==SIM:EndIf==%>
    <%==SIM:EndFor==%>

    <%==SIM:ForEach:Element.Operations==%>        
        <%==SIM:IfNot:Operation.HasStereotype("factory")==%>
            <%==SIM:Line==%>
            <%==SIM:If:Or(Operation.HasDocumentation,Operation.HasNestedDocumentation)==%>
            /// <%==SIM:Line==%><%==SIM:ForEach:Operation.DocumentationLines==%>
            /// <%==SIM:DocumentationLine==%><%==SIM:Line==%><%==SIM:EndFor==%><%==SIM:ForEach:Operation.Parameters==%>
            /// @param <%==SIM:Parameter.Name==%> <%==SIM:ToSingleLine(Parameter.Documentation)==%><%==SIM:Line==%>
            <%==SIM:EndFor==%><%==SIM:Line==%>
            <%==SIM:EndIf==%>                

            <%==SIM:Operation.Visibility==%><%==SIM:If:Operation.HasStereotype("async")==%> async<%==SIM:EndIf==%><%==SIM:If:Operation.IsStatic==%> static<%==SIM:EndIf==%><%==SIM:If:Operation.IsOverride==%> override<%==SIM:EndIf==%><%==SIM:If:Operation.IsVirtual==%> virtual<%==SIM:EndIf==%><%==SIM:If:Operation.IsAbstract==%> abstract<%==SIM:EndIf==%> <%==SIM:If:Operation.HasReturnType==%><%==SIM:Operation.ReturnType==%><%==SIM:EndIf==%><%==SIM:IfNot:Operation.HasReturnType==%>void<%==SIM:EndIf==%> <%==SIM:Operation.Name==%> (<%==SIM:ForEach:Operation.Parameters==%><%==SIM:If:Parameter.IsArray==%>List<<%==SIM:Parameter.Type==%>><%==SIM:Else==%><%==SIM:Parameter.Type==%><%==SIM:EndIf==%> <%==SIM:Parameter.Name==%><%==SIM:IfNot:IsLastItem==%>, <%==SIM:EndIf==%><%==SIM:EndFor==%>)<%==SIM:If:Operation.IsAbstract==%>;<%==SIM:EndIf==%>
            <%==SIM:Line==%>

            <%==SIM:IfNot:Operation.IsAbstract==%>
                {<%==SIM:StartBlock==%><%==SIM:Line==%>
                    <%==SIM:Operation.SourceCodeBody==%>
            
                <%==SIM:EndBlock==%><%==SIM:Line==%>
                }
                <%==SIM:IfNot:IsLastItem==%><%==SIM:Line==%><%==SIM:EndIf==%>
                
            <%==SIM:EndIf==%>
        <%==SIM:EndIf==%>
    <%==SIM:EndFor==%>
            

<%==SIM:EndBlock==%><%==SIM:Line==%>
}
