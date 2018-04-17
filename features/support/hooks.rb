
require_relative 'helper.rb'
World(Helper)

After '@deslogar_professor' do
    pagina_professor.deslogar
end

#depois de cada cenario ele tira um print e remove todos os espaços e virgulas
After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    scenario_name = scenario_name.delete(',', '')
    scenario_name = scenario_name.delete('(', '')
    scenario_name = scenario_name.delete(')', '')
    scenario_name = scenario_name.delete('#', '')

    #se o cenario falha, ele vai chamar o metodo take passado
    #dois parametros o nome do cenário com nome minusculo e o resultado
    if scenario.failed?
        take_screenshot(scenario_name.downcase!, 'failed')
    else
        take_screenshot(scenario_name.downcase!, 'passed')
    end
end
