require 'test_helper'

class CashDispensesControllerTest < ActionController::TestCase
  setup do
    @cash_dispense = cash_dispenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_dispenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_dispense" do
    assert_difference('CashDispense.count') do
      post :create, cash_dispense: { amount_due: @cash_dispense.amount_due, captured_amount: @cash_dispense.captured_amount, user_id: @cash_dispense.user_id }
    end

    assert_redirected_to cash_dispense_path(assigns(:cash_dispense))
  end

  test "should show cash_dispense" do
    get :show, id: @cash_dispense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_dispense
    assert_response :success
  end

  test "should update cash_dispense" do
    put :update, id: @cash_dispense, cash_dispense: { amount_due: @cash_dispense.amount_due, captured_amount: @cash_dispense.captured_amount, user_id: @cash_dispense.user_id }
    assert_redirected_to cash_dispense_path(assigns(:cash_dispense))
  end

  test "should destroy cash_dispense" do
    assert_difference('CashDispense.count', -1) do
      delete :destroy, id: @cash_dispense
    end

    assert_redirected_to cash_dispenses_path
  end
end
