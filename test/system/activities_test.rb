require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "creating a Activity" do
    visit activities_url
    click_on "New Activity"

    fill_in "Data Evento", with: @activity.data_evento
    fill_in "Descricao", with: @activity.descricao
    fill_in "Especificacao", with: @activity.especificacao
    fill_in "Grupo", with: @activity.grupo
    fill_in "Hora Computada", with: @activity.hora_computada
    fill_in "Instituicao", with: @activity.instituicao
    fill_in "Tema", with: @activity.tema
    fill_in "User", with: @activity.user_id
    click_on "Create Activity"

    assert_text "Atividade criada com sucesso"
    click_on "Back"
  end

  test "updating a Activity" do
    visit activities_url
    click_on "Edit", match: :first

    fill_in "Data Evento", with: @activity.data_evento
    fill_in "Descricao", with: @activity.descricao
    fill_in "Especificacao", with: @activity.especificacao
    fill_in "Grupo", with: @activity.grupo
    fill_in "Hora Computada", with: @activity.hora_computada
    fill_in "Instituicao", with: @activity.instituicao
    fill_in "Tema", with: @activity.tema
    fill_in "User", with: @activity.user_id
    click_on "Update Activity"

    assert_text "Atividade atualizada com sucesso"
    click_on "Back"
  end

  test "destroying a Activity" do
    visit activities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atividade excluída com sucesso"
  end
end
