using System;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace FirebaseProject
{
    public class MainMenu : MonoBehaviour
    {
        public static MainMenu instance;
        
        public GameObject loginTabButton;
        public GameObject registerTabButton;

        public GameObject loginPanel;
        public TMP_InputField loginEmailInput;
        public TMP_InputField loginPasswordInput;
        public Toggle toggleRememberMe;

        public GameObject registerPanel;
        public TMP_InputField registerEmailInput;
        public TMP_InputField registerPasswordInput;
        public GameObject emailExistWindow;
        public GameObject registationSuccessWindow;

        public GameObject playerSettingsWindow;
        public TMP_InputField playerNickname;
        public ColorPicker colorPicker;

        private void Awake()
        {
            if (instance == null)
                instance = this;
            else
                Destroy(this);
        }

        private void Start()
        {
            int remember = PlayerPrefs.GetInt("remember", 0);

            if (remember != 0)
                toggleRememberMe.isOn = true;
            else
                toggleRememberMe.isOn = false;
            
            loginEmailInput.text = PlayerPrefs.GetString("email", String.Empty);
            loginPasswordInput.text = PlayerPrefs.GetString("password", String.Empty);
        }

        public void RegisterPlayer()
        {
            FirebaseManager.instance.RegisterPlayer(registerEmailInput.text, registerPasswordInput.text);
        }

        public void LoginPlayer()
        {
            FirebaseManager.instance.LoginPlayer(loginEmailInput.text, loginPasswordInput.text);

            if (toggleRememberMe.isOn)
            {
                PlayerPrefs.SetString("email", loginEmailInput.text);
                PlayerPrefs.SetString("password", loginPasswordInput.text);
                PlayerPrefs.SetInt("remember", 1);
            }
            else
            {
                PlayerPrefs.SetString("", loginEmailInput.text);
                PlayerPrefs.SetString("", loginPasswordInput.text);
                PlayerPrefs.SetInt("remember", 0);
            }
        }

        public void ShowPlayerSettingsWindow()
        {
            loginPanel.SetActive(false);
            registerPanel.SetActive(false);
            loginTabButton.SetActive(false);
            registerTabButton.SetActive(false);
            playerSettingsWindow.SetActive(true);

             //= new Color(UnityEngine.Random.Range(0, 255), UnityEngine.Random.Range(0, 255), UnityEngine.Random.Range(0, 255));
        }

        public void SavePlayerSetting()
        {
            string player = playerNickname.text;
            Color playerColor = colorPicker.color;
            
            // DO SOMETHING WITH JSON AND FIREBASE HERE
        }
        
        public void ShowEmailExistWindow()
        {
            emailExistWindow.SetActive(true);
        }
        
        public void ShowRegisterSuccessWindow()
        {
            registationSuccessWindow.SetActive(true);
        }
        
        public void ShowLoginPanel()
        {
            loginPanel.SetActive(true);
            registerPanel.SetActive(false);
            loginTabButton.GetComponent<Button>().interactable = false;
            registerTabButton.GetComponent<Button>().interactable = true;
        }

        public void ShowRegisterPanel()
        {
            loginPanel.SetActive(false);
            registerPanel.SetActive(true);
            registerTabButton.GetComponent<Button>().interactable = false;
            loginTabButton.GetComponent<Button>().interactable = true;
        }
    }
}