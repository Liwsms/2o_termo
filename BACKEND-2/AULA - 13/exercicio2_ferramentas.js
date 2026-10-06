const fs = require('fs');
const entrada = require('readline-sync');

console.log("===CADASTRO DE FERRAMENTAS ===");
const Total = entrada.questionInt("Quantas ferramentas deseja cadastrar?");
const ListaFerramentas = [];

for(let i=0; i < Total; i++) {
  console.log(`\nItem ${i + 1} de ${Total}:`);
  const mome= entrada.question("Nome da ferramenta:  ");
  const quantidade = entrada.questionInt("Quantidade " );
  const custoUnitario = entrada.questionFloat("Custo Unitario (R$)");


ListaFerramentaserramentas.push({
nome:nome,
quantidade:quantidade,
custoUnitario: custoUnitario
});
}

fs.writeFileSync('ferramentas.json', JSON.stringify(ListaFerramentas, null, 2));
console.log("\n-------------------------------------------");
console.log(`sucesso: ${ListaFerramentas.length} itens gravados em 'ferramentas.json'.`);
console.log("\n-------------------------------------------");