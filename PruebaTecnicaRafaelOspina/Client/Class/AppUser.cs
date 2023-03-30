using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaTecnicaRafaelOspina.Client.Class
{
    public class AppUser
    {
        public bool IsLoggedIn { get; set; }
        public string username { get; set; }
        public event Action OnChange;

        public void SetLogin(bool login, string user)
        {
            IsLoggedIn = login;
            username = user;
            NotifyStateChanged();
        }

        private void NotifyStateChanged()
        {
            OnChange?.Invoke();
        }
    }
}
