package main

import (
	"fmt"
	"os"

	"github.com/koron/gtc/gtcore"
)

func main() {
	err := gtcore.DefaultCatalog.Merge([]gtcore.Tool{
		{
			Path: "github.com/Warashi/macbook-provisioning/mygtc",
			Desc: "My own go tools catalog",
		},
		{
			Path: "github.com/Warashi/rlink",
			Desc: "rlink - search files recursively and make symlinks",
		},
		{
			Path: "github.com/google/skicka",
			Desc: "skicka - command line tools for google drive",
		},
		{
			Path: "github.com/motemen/ghq",
			Desc: "ghq - Manage repote repository clones",
		},
		{
			Path: "github.com/golangci/golangci-lint/cmd/golangci-lint",
			Desc: "golangci-lint - lint tool",
		},
	}...).Run(os.Args)
	if err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}
}
