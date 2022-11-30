require "test_helper"

class ContractsControllerTest < ActionDispatch::IntegrationTest
  include ActionView::Helpers::DateHelper

  test "should get index" do
    contract = contracts(:one)
    sign_in users(:one)

    get root_path
    assert_select "h1", I18n.t("contracts.index.title")

    assert_select ".contract p[role=title]", contract.provider.name
    assert_select ".contract p[role=expires_at]", "Expires in #{distance_of_time_in_words_to_now(contract.expires_at)}"
  end
end
