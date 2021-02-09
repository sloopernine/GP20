using TMPro;
using UnityEngine;

namespace FirebaseProject
{
    public class MainMenu : MonoBehaviour
    {
        public GameObject loginTabButton;
        public GameObject registerTabButton;

        public GameObject loginPanel;
        public TMP_InputField loginEmailInput;
        public TMP_InputField loginPasswordInput;

        public GameObject registerPanel;
        public TMP_InputField registerEmailInput;
        public TMP_InputField registerPasswordInput;

        public void RegisterPlayer()
        {
            DataManager.instance.RegisterPlayer(registerEmailInput.text, registerPasswordInput.text);
        }

        public void LoginPlayer()
        {
            DataManager.instance.LoginPlayer(loginEmailInput.text, loginPasswordInput.text);
        }
        
        public void ShowLoginPanel()
        {
            loginPanel.SetActive(true);
            registerPanel.SetActive(false);
        }

        public void ShowRegisterPanel()
        {
            loginPanel.SetActive(false);
            registerPanel.SetActive(true);
        }
    }
}