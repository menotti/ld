module top_module (
	input a,
	input b,
	output out);
	// Cria um instancia de "mod_a" nomeada "inst1", e conecta as portas por nome:
	mod_a inst1 (
		.in2(b),	// Porta "in2" conecta ao fio "b"
		.in1(a), 	// Porta "in1" conecta ao fio "a"
		.out(out)	// Porta "out" conecta ao fio "out" 
				// (Nota: A porta "out" do "mod_a" não esta relaciona com a porta 
				// "out" de "top_module", é apenas coincidência terem o mesmo nome
	);
/*
	// Cria um instancia de "mod_a" nomeada "inst2", e conecta as portas por posição:
	mod_a inst2 (a, b, out);	// Os três fios são conectados nas portas in1, in2 e out, respectivamente.
*/
endmodule

