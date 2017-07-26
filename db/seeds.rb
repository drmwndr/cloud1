#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


uom_list_br = [ ["UNIDADE","UN"], ["PEÇA", "PÇ"], ["PACOTE", "PCT"], ["CAIXA", "CX"], ["METROS", "M"], 
				["ROLO", "RO"], ["CENTIMETROS", "CM"], ["LITROS", "L"], ["GALÃO", "GAL"], ["MILILITROS", "ML"]]

product_types_br = [ "USO COMUM", 
					 "AERONAUTICO/CONSUMIVEL", 
					 "AERONAUTICO/REPARAVEL", 
					 "AERONAUTICO/RETRABALHAVEL", 
					 "AERONAUTICO/NORMATIZADO" ]
conditions_br = [ "NOVO", "UTILIZAVEL", "NÃO UTILIZAVEL", "CONDENADO" ]

order_status_br =  [ "EM PROGRESSO", "FINALIZADO", "CANCELADO"]


uom_list_br.each { |description, uom| ProductUom.create(description: description, uom: uom) } if ProductUom.count == 0
product_types_br.each { |description| ProductType.create(description: description) } if ProductType.count == 0
conditions_br.each { |description| Condition.create(description: description) } if Condition.count == 0
order_status_br.each { |description| OrderStatus.create(description: description)} if OrderStatus.count == 0