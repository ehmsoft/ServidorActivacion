xml.instruct!

if @cuenta
	xml.result "true"
	xml.cuenta do
		xml.correo @cuenta.correo
		xml.pendiente @cuenta.pendiente
		xml.total @cuenta.total
	end
else
	xml.result "false"
end