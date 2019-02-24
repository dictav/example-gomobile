package mobile

import (
	"bytes"
	"encoding/json"
)

type User struct {
	Name   string `json:"name"`
	Point  int    `json:"point"`
	Avatar string `json:"avatar"`
}

func NewUser(data []byte) (*User, error) {
	u := User{}
	if err := json.Unmarshal(data, &u); err != nil {
		return nil, err
	}

	return &u, nil
}

func (u *User) ToJSON() ([]byte, error) {
	w := &bytes.Buffer{}
	enc := json.NewEncoder(w)
	enc.SetIndent("", "  ")
  err := enc.Encode(u)
	return w.Bytes(), err
}
