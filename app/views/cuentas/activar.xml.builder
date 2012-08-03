xml.instruct!
xml.response do
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
end