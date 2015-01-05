JobVacancy::App.controllers :page do
  
  get :about, :map => '/about' do
    render :slim, 'about'
  end

  get :contact, :map => '/contact' do
    render :slim, 'contact'
  end

  get :home, :map => '/home' do
    render :slim, 'home'
  end

end
